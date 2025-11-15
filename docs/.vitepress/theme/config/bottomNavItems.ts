// 底部导航栏项目配置

export interface BottomNavItem {
  to: string;
  label: string;
  icon: string;
}

export const bottomNavItems: BottomNavItem[] = [
  { to: "/", label: "首页", icon: "home-filled" },
  { to: "/guide/index", label: "指南", icon: "guide" },
  { to: "/feature/index", label: "功能", icon: "star" },
  { to: "/user/index", label: "User", icon: "user-filled" },
];
