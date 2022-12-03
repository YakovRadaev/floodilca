package ru.exam.floodilca.domain.util;

import ru.exam.floodilca.domain.User;

public abstract class MessageHelper {
    public static String getAuthorName(User author) {
        return author != null ? author.getUsername() : "<none>";
    }
}
