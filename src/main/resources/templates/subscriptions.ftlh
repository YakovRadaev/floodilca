<#import "parts/common.ftlh" as c>

<@c.page>
    <h4>${userChannel.username}</h4>
    <div> <#if type == "subscriptions">
            <p>Подписки :</p>
            <#else>
                <p>Подписчики :</p>
    </#if>
    </div>
    <ul class="list-group">
        <#list users as user>
            <li class="list-group-item">
                <a href="/user-messages/${user.id}">${user.getUsername()}</a>
            </li>
        </#list>
    </ul>
</@c.page>