<#import "parts/common.ftlh" as c>
<#import "parts/login.ftlh" as l>

<@c.page>
    <div class="my-5">
    <#if Session?? && Session.SPRING_SECURITY_LAST_EXCEPTION??>
        <div class="alert alert-danger" role="alert">
<#--            ${Session.SPRING_SECURITY_LAST_EXCEPTION.message}-->
            <#if Session.SPRING_SECURITY_LAST_EXCEPTION.message == "User is disabled">
            Учетная запись заблокирована. Пожалуйста обратитесь к администратору.
            <#elseif Session.SPRING_SECURITY_LAST_EXCEPTION.message == "Bad credentials">
            Введены неверные учетные данные. Попробуйте ещё раз.
            <#else>
            ${Session.SPRING_SECURITY_LAST_EXCEPTION.message}
            </#if>
        </div>
    </#if>
    <#if message??>
        <div class="alert alert-${messageType}" role="alert">
            ${message}
        </div>
    </#if>
    <@l.login "/login" false/>
    </div>
</@c.page>