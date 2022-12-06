<#import "parts/common.ftlh" as c>

<@c.page>
    Список пользователей :

    <table class="tabel">
        <thead class="thead">
        <tr>
            <th scope="col">Логин</th>
            <th scope="col">Роль</th>
            <th></th>
        </tr>
        </thead>
        <tbody>
        <#list users as user>
            <tr>
                <td>${user.username}</td>
                <td><#list user.roles as role>${role}<#sep>, </#list></td>
                <td><a href="/user/${user.id}">редактировать</a></td>
            </tr>
        </#list>
        </tbody>
    </table>
</@c.page>
