<#import "parts/common.ftlh" as c>
<#import "parts/login.ftlh" as l>

<@c.page>
    <div class="form-row">
        <div class="form-group col-md-8 mt-5">
            <form method="get" action="/" class="form-inline">
                <input type="text" name="filter" class="form-control" value="${filter?ifExists}" placeholder="Поиск по тегам" />
                <button type="submit" class="btn btn-primary ml-2">Поиск</button>
            </form>
        </div>
        <div class="form-group col-md-4 mt-5">
            <form method="get" action="/" class="form-inline">
                <select class="form-control" name="sorter">
<#--                    <option value="" selected disabled hidden>Выбрать статус</option>-->
                    <option value="by id">по дате</option>
                    <option value="by username">по автору</option>
                </select>
                <select class="form-control" name="vector">
                    <#--                    <option value="" selected disabled hidden>Выбрать статус</option>-->
                    <option value="ASC">по возростанию</option>
                    <option value="DESC">по убыванию</option>
                </select>
<#--                <input type="text" name="filter" class="form-control" value="${filter?ifExists}" placeholder="Поиск по тегам" />-->
                <button type="submit" class="btn btn-primary ml-2">Сортировать</button>
            </form>
        </div>
    </div>

    <#include "parts/messageEdit.ftlh" />
    <#include "parts/messageList.ftlh" />

</@c.page>
