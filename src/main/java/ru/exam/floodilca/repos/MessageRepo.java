package ru.exam.floodilca.repos;

import ru.exam.floodilca.domain.Message;
import ru.exam.floodilca.domain.User;
import ru.exam.floodilca.domain.dto.MessageDto;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

public interface MessageRepo extends CrudRepository<Message, Long> {

    @Query("select new ru.exam.floodilca.domain.dto.MessageDto(m, count(ml), sum(case when ml = :user then 1 else 0 end) > 0) from Message m left join m.likes ml group by m") Page<MessageDto> findAll(Pageable pageable, @Param("user") User user);

    @Query("select new ru.exam.floodilca.domain.dto.MessageDto(m, count(ml), sum(case when ml = :user then 1 else 0 end) > 0) from Message m left join m.likes ml WHERE UPPER(m.tag) LIKE CONCAT('%',UPPER(:tag),'%') AND m.status = true group by m order by m.id DESC ")
    Page<MessageDto> findByTagSortByIdDesc(Pageable pageable, @Param("tag") String tag, @Param("user") User user);

    @Query("select new ru.exam.floodilca.domain.dto.MessageDto(m, count(ml), sum(case when ml = :user then 1 else 0 end) > 0) from Message m left join m.likes ml WHERE UPPER(m.tag) LIKE CONCAT('%',UPPER(:tag),'%') AND m.status = true group by m order by m.id ASC")
    Page<MessageDto> findByTagSortByIdAsc(Pageable pageable, @Param("tag") String tag, @Param("user") User user);

    @Query("select new ru.exam.floodilca.domain.dto.MessageDto(m, count(ml), sum(case when ml = :user then 1 else 0 end) > 0) from Message m left join m.likes ml WHERE UPPER(m.tag) LIKE CONCAT('%',UPPER(:tag),'%') AND m.status = true group by m order by count(ml) ASC")
    Page<MessageDto>findByTagSortByLikesAsc(Pageable pageable, @Param("tag") String tag, @Param("user") User user);

    @Query("select new ru.exam.floodilca.domain.dto.MessageDto(m, count(ml), sum(case when ml = :user then 1 else 0 end) > 0) from Message m left join m.likes ml WHERE UPPER(m.tag) LIKE CONCAT('%',UPPER(:tag),'%') AND m.status = true group by m order by count(ml) DESC")
    Page<MessageDto>findByTagSortByLikesDesc(Pageable pageable, @Param("tag") String tag, @Param("user") User user);

    @Query("select new ru.exam.floodilca.domain.dto.MessageDto(m, count(ml), sum(case when ml = :user then 1 else 0 end) > 0) from Message m left join m.likes ml where m.author = :author and m.status = true group by m order by m.id DESC")
    Page<MessageDto> findByUser(Pageable pageable, @Param("author") User author, @Param("user") User user);
}
