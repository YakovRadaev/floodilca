<#include "security.ftlh">
<#import "pager.ftlh" as p>

<div class="card-columns" style="column-count: 4;" id="message-list">
    <#list page.content as message>
        <div class="card my-3" data-id="${message.id}">
            <#if message.filename??>
                <img src="/img/${message.filename}" class="card-img-top" />
            </#if>
            <div class="m-2">
                <span>${message.text}</span><br/>
                <i>#${message.tag}</i>
            </div>
            <div class="card-footer text-muted container">
                <div class="row">
                    <a class="col align-self-center" href="/user-messages/${message.author.id}">${message.authorName}</a>
                    <a class="col align-self-center" href="/messages/${message.id}/like">
                        <#if message.meLiked>
                            <i class="fas fa-heart"></i>
                        <#else>
                            <i class="far fa-heart"></i>
                        </#if>
                        ${message.likes}
                    </a>
                    <#if message.author.id == currentUserId || currentUserId == 6>
<#--                        <a class="col btn btn-primary" href="/user-messages/${message.author.id}?message=${message.id}">-->
<#--                            Редактировать-->
                        <a class="col align-self-right" href="/user-messages/${message.author.id}?message=${message.id}">
                            <i class="fa-solid fa-pen-to-square"></i>
                        </a>
<#--                        "/messages/{message}/delete"-->
                        <a class="col align-self-right" href="/messages/${message.id}/delete/">
<#--                        <a class="col align-self-right" href="/user-messages/${message.author.id}?message=${message.id}">-->
                            <i class="fa-sharp fa-solid fa-trash" style="font-size: larger"></i>
                        </a>
                    </#if>
                </div>
            </div>
        </div>
    <#else>
        Нет сообщений
    </#list>
</div>

<@p.pager page url />
