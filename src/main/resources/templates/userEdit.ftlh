<#import "parts/common.ftlh" as c>

<@c.page>
    <div container m-3>
        <h5>Редакторирование профиля пользователя:</h5>
    <form action="/user" method="post">
        <label for="username">Текущий логин : </label>
        <input type="text" name="username" value="${user.username}" />
        <label for="password">Сменить пароль : </label>
        <input type="text" name="password" placeholder="Поле ввода пароля"/>

        <#list roles as role>
            <div>
                <label><input type="checkbox" name="${role}" ${user.roles?seq_contains(role)?string("checked", "")} />${role}</label>
            </div>
        </#list>
        <p>
        Текущий статус : <#assign foo = user.active>
        ${foo?then("активный","забанен")}
        </p>
        <p>Выбрать статус :
        <select name="active">
            <#if foo>
                <option value=true selected>Активный</option>
                <option value=false>Бан</option>
            <#else>
                <option value=true>Активный</option>
                <option value=false selected>Бан</option>
            </#if>
        </select>
        </p>
        <input type="hidden" value="${user.id}" name="userId" />
        <input type="hidden" value="${_csrf.token}" name="_csrf" />
        <br>
        <br>
        <button type="submit">Сохранить</button>
    </form>
    </div>
</@c.page>