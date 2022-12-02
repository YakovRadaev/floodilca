<#import "parts/common.ftlh" as c>

<@c.page>
    Редактирование пользователя
    <form action="/user" method="post"></form>
    <input type="text" name="username" value="${user.username}" />
    <#list roles as role>
        <div>
            <label><input type="checkbox" name="${role}" ${user.roles?seq_contains(role)?string("checked", "")} />${role}</label>
        </div>
    </#list>
    <input type="hidden" value="${user.id}" name="userId" />
    <input type="hidden" value="${_csrf.token}" name="_csrf" />
    <button type="submit">Сохранить</button>
</@c.page>