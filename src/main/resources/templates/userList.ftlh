<#import "parts/common.ftlh" as c>

<@c.page>
    Список пользователей :
    <table class="table">
        <thead class="thead-dark">
        <tr>
            <th scope="col">Логин</th>
            <th scope="col">Роль</th>
            <th scope="col">Е-майл</th>
            <th scope="col">Статус</th>
            <th scope="col">Редактировать</th>
        </tr>
        </thead>
        <tbody>
        <#list users as user>
            <tr>
                <th scope="row">${user.username}</th>
                <td><#list user.roles as role>${role}<#sep>, </#list></td>
                <td>${user.email}</td>
                <td><#assign foo = user.active>
                    ${foo?then("активный","забанен")}
                </td>
                <td><a href="/user/${user.id}">
                        <i class="fa-solid fa-pen-to-square"></i>
                    </a>
                </td>
            </tr>
        </#list>
        </tbody>
    </table>
</@c.page>
