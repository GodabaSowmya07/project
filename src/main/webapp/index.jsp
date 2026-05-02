<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8"/>
<meta name="viewport" content="width=device-width,initial-scale=1"/>
<title>NexusShop — Modern UI</title>

<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600&family=Poppins:wght@600;700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

<style>
:root{
--bg:#0f172a;
--primary:#fff;
--accent:#6366f1;
--accent-light:#8b5cf6;
--muted:#94a3b8;
--card:#111827;
--surface:#1e293b;
--radius:16px;
}

*{box-sizing:border-box;margin:0;padding:0}
body{
font-family:Inter;
background:var(--bg);
color:var(--primary);
animation:fadeIn .6s ease;
}

@keyframes fadeIn{
from{opacity:0;transform:translateY(10px)}
to{opacity:1;transform:translateY(0)}
}

.container{max-width:1200px;margin:auto;padding:20px}

/* HEADER */
header{
position:sticky;
top:0;
background:rgba(15,23,42,.7);
backdrop-filter:blur(12px);
padding:15px 0;
z-index:10;
}
.header-inner{
display:flex;justify-content:space-between;align-items:center;
}
.brand{font-family:Poppins;font-size:22px;font-weight:700}
.brand span{color:var(--accent)}

.search{
background:var(--surface);
padding:8px 12px;
border-radius:999px;
display:flex;
}
.search input{
border:0;background:none;color:white;outline:none;
}

/* HERO */
.hero{
text-align:center;
padding:80px 20px;
background:linear-gradient(135deg,#6366f1,#8b5cf6,#06b6d4);
border-radius:0 0 30px 30px;
}
.hero h1{font-size:42px;margin-bottom:10px}
.btn{
padding:12px 20px;
border-radius:999px;
border:0;
cursor:pointer;
}
.btn-primary{
background:linear-gradient(135deg,#6366f1,#8b5cf6);
color:white;
box-shadow:0 4px 20px rgba(99,102,241,.5);
}
.btn-primary:hover{
transform:translateY(-2px);
}

/* GRID */
.grid{display:grid;gap:20px}
.categories{grid-template-columns:repeat(auto-fit,minmax(150px,1fr))}
.products{grid-template-columns:repeat(auto-fit,minmax(250px,1fr))}

/* CARD */
.card{
background:linear-gradient(145deg,#111827,#1f2937);
padding:20px;
border-radius:16px;
text-align:center;
transition:.3s;
border:1px solid rgba(255,255,255,.05);
}
.card:hover{
transform:translateY(-8px) scale(1.02);
box-shadow:0 20px 40px rgba(0,0,0,.5);
}

/* PRODUCT */
.product img{
width:100%;
height:200px;
object-fit:cover;
border-radius:12px;
}
.add-btn{
margin-top:10px;
padding:10px;
background:#6366f1;
border:none;
color:white;
border-radius:8px;
cursor:pointer;
}
.add-btn:hover{background:#8b5cf6}

/* FOOTER */
footer{text-align:center;padding:20px;color:var(--muted)}

</style>
</head>

<body>

<header>
<div class="container header-inner">
<div class="brand">Nexus<span>Shop</span></div>

<div class="search">
<input id="searchInput" placeholder="Search...">
<button onclick="search()">🔍</button>
</div>

<div>🛒 <span id="cartCount">0</span></div>
</div>
</header>

<section class="hero">
<h1>Premium Shopping Experience</h1>
<p>Modern UI E-Commerce Store</p>
<button class="btn btn-primary" onclick="scrollToProducts()">Shop Now</button>
</section>

<section class="container">
<h2>Categories</h2>
<div class="grid categories" id="categories"></div>
</section>

<section class="container">
<h2 id="productsTitle">Products</h2>
<div class="grid products" id="products"></div>
</section>

<footer>
© 2026 NexusShop
</footer>

<script>
const categories=["Phones","Laptops","Shoes","Accessories"];

const products=[
{id:1,title:"iPhone",price:999,img:"https://images.unsplash.com/photo-1601784551446-20c9e07cdbdb"},
{id:2,title:"Laptop",price:1200,img:"https://images.unsplash.com/photo-1593642632823"},
{id:3,title:"Shoes",price:150,img:"https://images.unsplash.com/photo-1542291026"},
{id:4,title:"Watch",price:300,img:"https://images.unsplash.com/photo-1523275335684"}
];

let cart=0;

function renderCategories(){
let html="";
categories.forEach(c=>{
html+=`<div class="card">${c}</div>`;
});
document.getElementById("categories").innerHTML=html;
}

function renderProducts(list){
let html="";
list.forEach(p=>{
html+=`
<div class="card product">
<img src="${p.img}">
<h4>${p.title}</h4>
<p>$${p.price}</p>
<button class="add-btn" onclick="addToCart()">Add</button>
</div>`;
});
document.getElementById("products").innerHTML=html;
}

function addToCart(){
cart++;
document.getElementById("cartCount").innerText=cart;
}

function search(){
let q=document.getElementById("searchInput").value.toLowerCase();
let filtered=products.filter(p=>p.title.toLowerCase().includes(q));
renderProducts(filtered);
}

function scrollToProducts(){
document.getElementById("productsTitle").scrollIntoView({behavior:"smooth"});
}

renderCategories();
renderProducts(products);
</script>

</body>
</html>
