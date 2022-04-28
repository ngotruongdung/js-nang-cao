// Lấy danh sách categories
var url = "http://localhost:3000/categories";
var menuCat = document.querySelector("#menu-product");
if (menuCat) {
  fetch(url)
    .then((data) => data.json())
    .then((categories) => {
      cat_arr = categories
        .map((cat) => {
          return `
            <li>
                <a href="#">${cat.name}</a>
            </li>
        `;
        })
        .join("");
      menuCat.innerHTML += cat_arr;
    });
}

// Lấy danh sách products
var productList = document.querySelector("#product-list");
if (productList) {
  var url = "http://localhost:3000/products";
  fetch(url)
    .then((data) => data.json())
    .then((products) => {
      pro_arr = products.map((pro) => {
        return `
            <div class="product-item">
            <div class="image"><img src="${pro.image}" alt=""></div>
                
                <a href="detail.html?id=${pro.id}" class="product-name">${pro.name}</a>
                <b class="product-price">$ ${pro.price}</b>
                <button class="add-product" onclick="addProdcut(${pro.id}, '${pro.name}', ${pro.price}, '${pro.image}')">+</button>
            </div>
        `;
      });
      productList.innerHTML += pro_arr;
    });
}

// Thêm Sản Phẩm Vào Giỏ Hàng
function addProdcut( id, name, price, image) {
  var cart = JSON.parse(localStorage.getItem("cart"));
  if (cart == null) {
    cart = [];
    cart.push({ id: id, name: name, price: price, image: image, quantity: 1 });
  } else {
    let item = cart.find((item) => item.id === id);
    if (item) item.quantity++;
    else
      cart.push({
        id: id,
        name: name,
        price: price,
        image: image,
        quantity: 1,
      });
  }
  localStorage.setItem("cart", JSON.stringify(cart));
}

// Show giỏ hàng
var listCart = document.querySelector("#list-cart");
if (listCart) {
  var cart = JSON.parse(localStorage.getItem("cart"));
  if (cart)
    cart.forEach((pro, index) => {
      listCart.innerHTML += `
        <tr>
            <td> <img src="${pro.image}" alt="" width="100%"></td>
            <td><p>${pro.name}</p></td>
            <td><b class="price">$${pro.price}</b></td>
            <td><input type="number" value="${
              pro.quantity
            }" onchange="countProduct(${pro.id}, ${
        pro.price
      }, this.value, ${index})"></td>
            <td><p class="total" data-price="${pro.price * pro.quantity}">$${
        pro.price * pro.quantity
      }</p></td>
        </tr>    
    `;
    });
}

// Show giỏ hàng trang thanh toán
var listCartCheckOut = document.querySelector("#list-cart-checkout");
if (listCartCheckOut) {
  var cart = JSON.parse(localStorage.getItem("cart"));
  if (cart)
    cart.forEach((pro, index) => {
      listCartCheckOut.innerHTML += `
        <tr>
            <td> <img src="${pro.image}" alt="" width="100%"></td>
            <td><p>${pro.name}</p></td>
            <td><b class="price">$${pro.price}</b></td>
            <td><p>${pro.quantity}</p></td>
            <td><p class="total">${pro.price * pro.quantity}</p></td>
        </tr>    
    `;
    });
}

// Tính tiền khi đổi số lượng sản phẩm

function countProduct(id, price, quantity, i) {
  var cart = JSON.parse(localStorage.getItem("cart"));
  let item = cart.find((item) => item.id === id);
  if (item) item.quantity = quantity;
  localStorage.setItem("cart", JSON.stringify(cart));
  total = price * quantity;
  document.getElementsByClassName("total")[i].innerText = total;
  totalBill();
}

function totalBill() {
  arrTotal = document.querySelectorAll(".list-cart .total");
  let totalBill = 0;
  for (let t of arrTotal) {
    totalBill += Number(t.dataset.price);
    console.log(totalBill);
  }
  document.querySelector("#total-bill").innerText = totalBill;
}

// Click nút thanh toán chuyển trang check-out
// document.querySelector('#btn-checkout').onclick = function(){
//     document.location="check-out.html"
// }

// Nút đặt hàng trang check-out

document.querySelector("#btnOrder").onclick = function () {
  // e.preventDefault();
  nameInput = document.querySelector("#name").value;
  emailInput = document.querySelector("#email").value.trim();
  phoneInput = document.querySelector("#phone").value.trim();
  addressInput = document.querySelector("#address").value;

  if (nameInput == "") {
    alert("Chưa nhập tên");
    return;
  }
  if (emailInput == "") {
    alert("Chưa nhập email");
    return;
  }
  if (phoneInput == "") {
    alert("Chưa nhập số điện thoại");
    return;
  }
  if (addressInput == "") {
    alert("Chưa nhập địa chỉ");
    return;
  }

  var orderNew = {
    cus_name: nameInput,
    cus_add: addressInput,
    cus_email: emailInput,
    cus_phone: phoneInput,
    creat_day: new Date().toISOString().slice(0, 10),
    status: "Đơn Hàng Mới",
  };

  url = "http://localhost:3000/orders";
  options = {
    method: "post",
    body: JSON.stringify(orderNew),
    headers: { "Content-Type": "application/json" },
  };
  fetch(url, options)
    .then((res) => res.json())
    .then((data) => {
      order_id = data.id;
      // Lưu chi tiết đơn hàng
      saveProductOrder(order_id);
      console.log(data);
    });

  alert("Chào bạnnn");
};
// Lưu chi tiết đơn hàng
function saveProductOrder(order_id) {
  let cart = JSON.parse(localStorage.getItem("cart"));
  cart.forEach((pro) => {
    let objPro = {
      order_id: order_id,
      product_id: pro.id,
      quantiny: pro.quantiny,
      unti_price: pro.price,
    };
    (url = "http://localhost:3000/orders-details"),
      (options = {
        method: "post",
        body: JSON.stringify(objPro),
        headers: { "Content-Type": "application/json" },
      });
    fetch(url, options)
      .then((res) => res.json())
      .then((d) => {});
  });
}

// Admin Dasbord
