<#import "*/macros/common.ftlh" as c>
<@c.page>
    <main class="container">
        <h2 class="mb-3" align="center">Создать дом</h2>
        <form action="/houses/add" method="post">
            <div class="form-group row">
                <label class="col-sm-3 col-form-label">Description:</label>
                <div class="col-sm-9">
                    <input required autofocus type="text"
                           name="description" class="form-control ${(messageError??)?string('is-invalid', '')}"
                           placeholder="Введите описание дома">

                    <#if messageError??>
                        <div class="invalid-feedback">${messageError}</div>
                    </#if>
                </div>
            </div>
            <hr>
            <button type="submit" class="btn btn-block btn-success m-0">Сохранить</button>
        </form>

        <a href="/houses" class="btn btn-outline-secondary m-0 mt-1 mb-3">Назад</a>
    </main>
</@c.page>