<#import "*/macros/common.ftlh" as c>
<@c.page>
    <a href="/devices" class="btn btn-block btn-secondary m-0 mt-1 mb-3">Перейти к просмотру устройств</a>

    <table id="table_id" class="table table-striped table-bordered mt-0 mx-auto" style="width:95%;">
        <thead>
        <tr>
            <th>Id</th>
            <th>Description</th>
            <th></th>
        </tr>
        </thead>
        <tbody>
        <#list houses as house>
            <tr>
                <td>${house.id}</td>
                <td>${house.description}</td>
                <td>
                    <form action="/houses/${house.id}">
                        <button type="submit" class="btn btn-sm btn-info m-0">Просмотреть</button>
                    </form>
                </td>
            </tr>
        </#list>
        </tbody>
    </table>

    <div class="d-flex justify-content-center mt-3">
        <a href="/houses/add" class="btn btn-primary">Добавить</a>
    </div>
</@c.page>