
url = "http://localhost:3000/products";
fetch(url).then( res => res.json())
.then( listPro => {
    listPro.forEach ( pro => {
       document.querySelector('#list-pro-admin').innerHTML += `<tr>
                    <td>${pro.name}</td>
                    <td><img src="${pro.image}" alt="" width="80"></td>
                    <td>${pro.price}</td>
                    <td>20</td>
                    <td>
                        <a href="edit-product.html?id=${pro.id}" class="button-19">Sửa</a>
                        <a href="#" onclick="delPro(${pro.id})" class="button-19">Xóa</a>
                    </td>
                </tr>`;
    })
})


// Xóa sản phẩm
function delPro(id){
    const question = confirm ("You can delete product");
    if (question == false) return;
    url=`http://localhost:3000/products/${id}`;
    fetch(url, {method: "delete"}).then(res => res.json()).then( data =>{
        console.log( data )
        alert("Đã xóa")
        document.location="list-product.html"
    })
}

btnAdd = document.querySelector('#btnAdd');
btnAdd.onclick = function(){
    url = "http://localhost:3000/products";
    pro = {
        name: document.querySelector('#name').value.trim(),
        price: document.querySelector('#price').value.trim(),
        image: document.querySelector('#image').value.trim(),
        detail: document.querySelector('#detail').value.trim(),
        cat_id:document.querySelector('#cat-id').value.trim()
    }
    console.log(pro);
    options = {
        method: "post",
        body: JSON.stringify(pro),
        headers: {'Content-Type':'application/json'}
    }
    fetch(url, options).then( res => res.json())
    .then ( data => {
        console.log(data);
        document.location='list-product.html';
    })
}