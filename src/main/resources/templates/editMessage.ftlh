<#import "parts/common.ftlh" as c>

<@c.page>
    <div m-3>
        <h5>Редакторирование сообщения: </h5>
        <div class="form-row">
            <div class="form-group col-md-6 my-1 mx-5">
                <form action="/user" method="post">
                    <input type="hidden" value="${message.id}" name="id" />
                    <input type="hidden" value = true name="active" />
<#--                    <input type="hidden" value="${message.author}" name="user_id" />-->
                    <input type="hidden" value="${_csrf.token}" name="_csrf" />
<#--                    <label for="author">Автор : </label>-->
<#--                    <input type="text" class="form-control" name="username" value="${message.authorName}" readonly/>-->
                    <label for="tag">Тег : </label>
                    <input type="text" class="form-control" name="tag" value="${message.tag}" />
                    <div class="form-group">
                        <label for="text">Сообщение : </label>
                        <textarea class="form-control" id="text" rows="5">${message.text}</textarea>
                    </div>
                    <div class="mt-2">
                        <button type="button" class="btn btn-primary ml-2">Принять</button>
                        <button type="reset" class="btn btn-secondary ml-2">Отменить</button>
                    </div>
            </div>
            <div class="form-group col-md-4 my-1" mx-5>
                <label for="file">Выберите изображение</label>
                <input type="file" class="form-control" name="file" id="customFile" />
                <label for="author">Текущее изображение : </label>
<#--            <input type="text" class="form-control" name="image" value="${message.authorName}" readonly/>-->
                <#if message.filename??>
                    <img src="/img/${message.filename}" class="card-img-top" />
                </#if>

            </form>
        </div>
        </div>
</@c.page>