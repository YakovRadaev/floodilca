package ru.exam.floodilca.service;

import ru.exam.floodilca.domain.User;
import ru.exam.floodilca.domain.dto.MessageDto;
import ru.exam.floodilca.repos.MessageRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

@Service
public class MessageService {
    @Autowired
    private MessageRepo messageRepo;

    public Page<MessageDto> messageList(Pageable pageable, String filter, String sorter, User user) {
        if (filter != null && !filter.isEmpty()) {
//            filter = "%";
//            return messageRepo.findByTag(pageable, filter, user);
//            return messageRepo.findByTagSortByDesc(pageable, filter, user);

        }
//        else {
//            return messageRepo.findByStatus(pageable, user);
////                return messageRepo.findByStatus(pageable, user);
//        }
        switch (sorter) {
            case "idDesc":
                return messageRepo.findByTagSortByIdDesc(pageable, filter, user);
//            break;
            case "idAsc":
                return messageRepo.findByTagSortByIdAsc(pageable, filter, user);
//            break;
            case "likesDesc":
                return messageRepo.findByTagSortByLikesDesc(pageable, filter, user);
//            break;
            case "likesAsc":
                return messageRepo.findByTagSortByLikesAsc(pageable, filter, user);
//            break;
            default:
        }
        return messageRepo.findByTagSortByIdDesc(pageable, filter, user);
    }


    public Page<MessageDto> messageListForUser(Pageable pageable, User author, User currentUser) {
        return messageRepo.findByUser(pageable, author, currentUser);
    }
}
