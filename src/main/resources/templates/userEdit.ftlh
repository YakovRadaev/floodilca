<#import "parts/common.ftlh" as c>

<@c.page>
    <div container m-3>
    Редакторирование профиля пользователя:
    <form action="/user" method="post">
        <input type="text" name="username" value="${user.username}" />
        <#list roles as role>
            <div>
<#--                <select name="${role}">-->
<#--                    <option value="USER">Пользователь</option>-->
<#--                    <option value="ADMIN">Администратор</option>-->
<#--                </select>-->
                <label><input type="checkbox" name="${role}" ${user.roles?seq_contains(role)?string("checked", "")} />${role}</label>
            </div>
        </#list>
        Статус : <#assign foo = user.active>
        ${foo?then("активный","забанен")}

        <select name="active">
            <option value="" selected disabled hidden>Выбрать статус</option>
            <option value=true>Активный</option>
            <option value=false>Бан</option>
        </select>

        <input type="hidden" value="${user.id}" name="userId" />
        <input type="hidden" value="${_csrf.token}" name="_csrf" />
        <br>
        <br>
        <button type="submit">Сохранить</button>
    </form>
    </div>
</@c.page>