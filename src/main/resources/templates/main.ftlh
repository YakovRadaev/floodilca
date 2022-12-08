<#import "parts/common.ftlh" as c>
<#import "parts/login.ftlh" as l>
<#--<#import "parts/security.ftlh" as s>-->

<@c.page>
    <div class="form-row">
        <div class="form-group col-md-5 mt-2">
            <form method="get" action="/main" class="form-inline">
                <input type="text" name="filter" class="form-control" value="${filter?ifExists}" placeholder="Поиск по тегам" />
                <button type="submit" class="btn btn-primary ml-2">Поиск</button>
            </form>
        </div>
    </div>
<#--<#if currentUserId == -1>-->
    <#include "parts/messageEdit.ftlh" />
<#--</#if>-->
    <#include "parts/messageList.ftlh" />

</@c.page>
