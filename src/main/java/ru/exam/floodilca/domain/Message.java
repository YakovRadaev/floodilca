package ru.exam.floodilca.domain;

import ru.exam.floodilca.domain.util.MessageHelper;
import org.hibernate.validator.constraints.Length;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import java.util.HashSet;
import java.util.Set;

@Entity
public class Message {
    @Id
    @GeneratedValue(strategy=GenerationType.AUTO)
    private Long id;

    @NotBlank(message = "Пожалуйста, заполните сообщение")
    @Length(max = 2048, message = "Сообщение слишком длинное (максимум 2000 символов)")
    private String text;
    @Length(max = 255, message = "Тег слишком длинный (максимум 255 символов)")
    private String tag;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "user_id")
    private User author;

    private String filename;

    private Boolean status;

    @ManyToMany
    @JoinTable(
            name = "message_likes",
            joinColumns = { @JoinColumn(name = "message_id") },
            inverseJoinColumns = { @JoinColumn(name = "user_id")}
    )
    private Set<User> likes = new HashSet<>();

    public Message() {
    }

    public Message(String text, String tag, User user) {
        this.author = user;
        this.text = text;
        this.tag = tag;
    }

    public String getAuthorName() {
        return MessageHelper.getAuthorName(author);
    }

    public User getAuthor() { return author; }

    public void setAuthor(User author) { this.author = author; }

    public void setText(String text) { this.text = text; }

    public String getText() { return text; }

    public Long getId() { return id; }

    public void setId(Long id) { this.id = id; }

    public String getTag() { return tag; }

    public void setTag(String tag) { this.tag = tag; }

    public String getFilename() { return filename; }

    public Set<User> getLikes() { return likes; }

    public void setLikes(Set<User> likes) { this.likes = likes; }

    public void setFilename(String filename) { this.filename = filename; }

    public Boolean getStatus() {
        return status;
    }

    public void setStatus(Boolean status) {
        this.status = status;
    }
}