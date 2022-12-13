<#import "parts/common.ftlh" as c>

<@c.page>
    <form action="/messages/${message.id}/save" method="post" enctype="multipart/form-data">
        <p>Редакторирование сообщения: </p>
        <label for="author">Автор : </label>
        <input type="text" class="form-control" name="username" value="${message.authorName}" readonly/>
        <input type="hidden" value="${message.id}" name="id" />
        <input type="hidden" value = true name="active" />
        <input type="hidden" value="${_csrf.token}" name="_csrf" />
        <div class="row">
            <div class="col-6">
                        <label for="tag">Тег : </label>
                        <input type="text" class="form-control" name="tag" value="${message.tag}" />
                        <label for="text">Сообщение : </label>
                        <textarea class="form-control" name="text" id="text" rows="8">${message.text}</textarea>
                <div class="mt-2">
                    <button type="submit" class="btn btn-primary ml-2">Принять</button>
                    <button type="reset" class="btn btn-secondary ml-2">Отменить</button>
                </div>
            </div>
            <div class="col-6">
                        <label for="file">Выберите изображение</label>
                        <input type="file" class="form-control" name="file" id="file" placeholder="Для изменения, выберите новый файл"/>
                        <label for="author">Текущее изображение : </label>
        <#--            <input type="text" class="form-control" name="image" value="${message.authorName}" readonly/>-->
                        <#if message.filename??>
                            <img src="/img/${message.filename}" class="card-img-top" id="imgedit"/>
                        </#if>
            </div>
        </div>
    </form>
<#--            </div>-->
<#--        </div>-->
</@c.page>