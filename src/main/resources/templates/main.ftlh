<#import "parts/common.ftlh" as c>
<#import "parts/login.ftlh" as l>

<@c.page>
    <div class="form-row">
        <div class="form-group col-md-7 mt-5">
            <form method="get" action="/" class="form-inline">
                <input type="text" name="filter" class="form-control mx-2" value="${filter?ifExists}" placeholder="Поиск по тегам" />
                <select class="form-control" name="sorter" value="${sorter?ifExists}">
                    <option value="">Тип сортировки</option>
                    <option value="idDesc">Сначала последние</option>
                    <option value="idAsc">Сначала ранние</option>
                    <option value="likesDesc">Больше лайков</option>
                    <option value="likesAsc">Меньше лайков</option>
                </select>
                <button type="submit" class="btn btn-primary ml-2">Поиск</button>
            </form>
        </div>
        <div class="form-group col-md-5 mt-5">
<#--            <form method="get" action="/" class="form-inline">-->
<#--                <select class="form-control" name="sorter" value="${sorter?ifExists}">-->
<#--                    <option value="">Тип сортировки</option>-->
<#--                    <option value="idDesc">Сначала последние</option>-->
<#--                    <option value="idAsc">Сначала ранние</option>-->
<#--                    <option value="likesDesc">Больше лайков</option>-->
<#--                    <option value="likesAsc">Меньше лайков</option>-->
<#--                </select>-->
<#--&lt;#&ndash;                <#if (sorter == "id")??>&ndash;&gt;-->
<#--&lt;#&ndash;                    <select class="form-control" name="vector">&ndash;&gt;-->
<#--&lt;#&ndash;                        <option value="DESC">Последние</option>&ndash;&gt;-->
<#--&lt;#&ndash;                        <option value="ASC">Ранние</option>&ndash;&gt;-->
<#--&lt;#&ndash;                    </select>&ndash;&gt;-->
<#--&lt;#&ndash;                <#else>&ndash;&gt;-->
<#--&lt;#&ndash;                    <select class="form-control" name="vector">&ndash;&gt;-->
<#--&lt;#&ndash;                        <option value="DESC">По убыванию</option>&ndash;&gt;-->
<#--&lt;#&ndash;                        <option value="ASC">По возростанию</option>&ndash;&gt;-->
<#--&lt;#&ndash;                    </select>&ndash;&gt;-->
<#--&lt;#&ndash;                </#if>&ndash;&gt;-->
<#--&lt;#&ndash;                <select class="form-control" name="vector" value="DESC">&ndash;&gt;-->
<#--&lt;#&ndash;                    <option value="DESC">По возростанию</option>&ndash;&gt;-->
<#--&lt;#&ndash;                    <option value="ASC">По убыванию</option>&ndash;&gt;-->
<#--&lt;#&ndash;                </select>&ndash;&gt;-->
<#--&lt;#&ndash;                <input type="text" name="filter" class="form-control" value="${filter?ifExists}" placeholder="Поиск по тегам" />&ndash;&gt;-->
<#--                <button type="submit" class="btn btn-primary ml-2">Сортировать</button>-->
<#--            </form>-->
        </div>
    </div>

    <#include "parts/messageEdit.ftlh" />
    <#include "parts/messageList.ftlh" />

</@c.page>