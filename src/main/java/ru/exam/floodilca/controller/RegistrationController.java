package ru.exam.floodilca.controller;

import ru.exam.floodilca.domain.User;
import ru.exam.floodilca.domain.dto.CaptchaResponseDto;
import ru.exam.floodilca.service.UserSevice;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;

import javax.validation.Valid;
import java.util.Collections;
import java.util.Map;

@Controller
public class RegistrationController {
//    private final static String CAPTCHA_URL = "https://www.google.com/recaptcha/api/siteverify?secret=%s&response=%s";

    @Autowired
    private UserSevice userSevice;

//    @Value("${recaptcha.secret}")
//    private String secret;

//    @Autowired
//    private RestTemplate restTemplate;

    @GetMapping("/registration")
    public String registration() {
        return "registration";
    }

    @PostMapping("/registration")
    public String addUser(
            @RequestParam("password2") String passwordConfirm,
//            @RequestParam("g-recaptcha-response") String captchaResponce,
            @Valid User user,
            BindingResult bindingResult,
            Model model
    ) {
//        String url = String.format(CAPTCHA_URL, secret, captchaResponce);
//        CaptchaResponseDto response = restTemplate.postForObject(url, Collections.emptyList(), CaptchaResponseDto.class);

//        if (!response.isSuccess()) {
//            model.addAttribute("captchaError", "Fill captcha");
//        }

        boolean isConfirmEmpty = StringUtils.isEmpty(passwordConfirm);

        if (isConfirmEmpty) {
            model.addAttribute("password2Error", "Пароль не сожет быть пустым");
        }

        if (user.getPassword() != null && !user.getPassword().equals(passwordConfirm)) {
            model.addAttribute("passwordError", "Пароли отличаются!");
        }

//        if (isConfirmEmpty || bindingResult.hasErrors() || !response.isSuccess()) {
//            Map<String, String> errors = ControllerUtils.getErrors(bindingResult);

            if (isConfirmEmpty || bindingResult.hasErrors()) {
                Map<String, String> errors = ControllerUtils.getErrors(bindingResult);

            model.mergeAttributes(errors);

            return "registration";
        }

        if (!userSevice.addUser(user)) {
            model.addAttribute("usernameError", "Логин занят! Выберите другой или войдите под своей учетной записью");
            return "registration";
        }

        return "redirect:/login";
    }

    @GetMapping("/activate/{code}")
    public String activate(Model model, @PathVariable String code) {
        boolean isActivated = userSevice.activateUser(code);

        if (isActivated) {
            model.addAttribute("messageType", "success");
            model.addAttribute("message", "Учетная запись активирована");
        } else {
            model.addAttribute("messageType", "danger");
            model.addAttribute("message", "Код активации не найден!");
        }

        return "login";
    }
}
