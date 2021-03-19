import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { InfoComponent } from './info/info.component';
import { ItemComponent } from './item/item.component';
import { LoginComponent } from './login/login.component';
import { OrderComponent } from './order/order.component';
import { ShopComponent } from './shop/shop.component';

const routes: Routes = [
  { path: '', redirectTo: '/shop', pathMatch: 'full' },
  { path: 'order', component: OrderComponent },
  { path: 'info', component: InfoComponent },
  { path: 'login', component: LoginComponent },
  { path: 'item/:itemId', component: ItemComponent },
  { path: 'shop', component: ShopComponent },
  { path: 'shop/category/:categoryId', component: ShopComponent },
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
