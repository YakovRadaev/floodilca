<#import "parts/common.ftlh" as c>

<@c.page>
    <h4 m-1>Список пользователей :</h4>
    <table class="table table-hover table-responsive-lg">
        <thead class="thead-dark">
        <tr>
            <th style="width: 30%">Логин</th>
            <th style="width: 10%" scope="col">Роль</th>
            <th style="width: 30%" scope="col">Е-майл</th>
            <th style="width: 15%" scope="col">Статус</th>
            <th style="width: 15%" scope="col">Редактировать</th>
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
