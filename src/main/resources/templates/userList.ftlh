<#import "parts/common.ftlh" as c>

<@c.page>
    <h4 m-1>Список пользователей :</h4>
    <table class="table table-hover table-responsive-lg">
        <thead class="thead-dark">
        <tr>
            <th style="width: 20%">Логин</th>
            <th style="width: 15%" scope="col">Роль</th>
            <th style="width: 35%" scope="col">Е-майл</th>
            <th style="width: 15%" scope="col">Статус</th>
            <th style="width: 15%" scope="col">Редактировать</th>
        </tr>
        </thead>
        <tbody>
        <#list users as user>
            <tr>
                <th style="width: 20%" scope="row">${user.username}</th>
                <td style="width: 15%"><#list user.roles as role>${role}<#sep>, </#list></td>
                <td style="width: 35%">${user.email}</td>
                <td style="width: 15%"><#assign foo = user.active>
                    ${foo?then("активный","забанен")}
                </td>
                <td align="center" style="width: 15%"><a href="/user/${user.id}">
                        <i class="fa-solid fa-pen-to-square"></i>
                    </a>
                </td>
            </tr>
        </#list>
        </tbody>
    </table>
</@c.page>
