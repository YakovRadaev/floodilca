package ru.exam.floodilca.repos;

import org.springframework.data.jpa.repository.JpaRepository;
import ru.exam.floodilca.domain.User;

public interface UserRepo extends JpaRepository<User, Long> {
    User findByUsername(String username);

    User findByActivationCode(String code);
}