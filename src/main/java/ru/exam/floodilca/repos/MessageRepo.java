package ru.exam.floodilca.repos;

import org.springframework.data.repository.CrudRepository;
import ru.exam.floodilca.domain.Message;

import java.util.List;

public interface MessageRepo extends CrudRepository<Message, Long> {
    List<Message> findByTag(String tag);
}
