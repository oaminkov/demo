<#import "*/macros/common.ftlh" as c>
<@c.page>
    <table id="table_id" class="table table-striped table-bordered mt-0" style="width:100%">
        <thead>
        <tr>
            <th>Id</th>
            <th>Description</th>
        </tr>
        </thead>
        <tbody>
        <#list houses as house>
            <tr>
                <td>${house.id}</td>
                <td>${house.description}</td>
            </tr>
        </#list>
        </tbody>
    </table>
</@c.page>