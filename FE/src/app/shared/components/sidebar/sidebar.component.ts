import { Component } from '@angular/core';

interface MenuItem {
  label: string;
  icon: string;
  route?: string;
  children?: MenuItem[];
  isOpen?: boolean;  // Añadimos esta propiedad
}

@Component({
  selector: 'app-sidebar',
  templateUrl: './sidebar.component.html',
  styleUrls: ['./sidebar.component.scss']
})
export class SidebarComponent {
  isExpanded = false;

  menuItems: MenuItem[] = [
    {
      label: 'Home',
      icon: 'dashboard',
      route: '/adquisiciones'
    }
  ];

  toggleSidebar() {
    this.isExpanded = !this.isExpanded;
  }

  toggleSubmenu(item: MenuItem) {
    item.isOpen = !item.isOpen;
  }
}