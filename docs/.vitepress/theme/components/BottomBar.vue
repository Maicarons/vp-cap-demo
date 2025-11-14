<template>
    <nav class="vp-bottombar" role="navigation" aria-label="Bottom navigation">
        <a v-for="item in items" :key="item.to" :href="item.to" class="vp-bottombar-item"
            :class="{ active: isActive(item) }" @click="onClick">
            <span class="icon" aria-hidden="true">{{ item.icon }}</span>
            <span class="label">{{ item.label }}</span>
        </a>
    </nav>
</template>

<script setup lang="ts">
import { useRoute, useRouter } from "vitepress";

const route = useRoute();
const router = useRouter();

const items = [
    { to: "/", label: "首页", icon: "🏠" },
    { to: "/guide/index", label: "指南", icon: "📘" },
    { to: "/feature/", label: "功能", icon: "✨" },
    { to: "/guide/api/index", label: "API", icon: "🔌" },
];

function isActive(item: { to: string }) {
    const rawPath = (route && (route as any).path) || (typeof window !== "undefined" ? window.location.pathname : "/");
    // Normalize to always end with a single slash, except keep root as '/'
    const normalize = (p: string) => {
        if (!p) return "/";
        // strip query/hash
        const idx = p.indexOf("?");
        if (idx !== -1) p = p.slice(0, idx);
        const hidx = p.indexOf("#");
        if (hidx !== -1) p = p.slice(0, hidx);
        if (p === "/") return "/";
        return p.endsWith("/") ? p : p + "/";
    };

    const currentPath = normalize(rawPath);
    const target = normalize(item.to);

    // root should match only exact root
    if (target === "/") {
        return currentPath === "/";
    }

    return currentPath === target || currentPath.startsWith(target);
}

function onClick(e: MouseEvent) {
    // Allow modifier clicks (open in new tab/window) and non-left clicks
    if (e.defaultPrevented) return;
    if ((e as any).button !== 0 || e.metaKey || e.ctrlKey || e.shiftKey || e.altKey) return;
    const target = e.currentTarget as HTMLAnchorElement | null;
    const href = target?.getAttribute("href") || "/";
    e.preventDefault();
    const routerAny = router as any;
    if (router && routerAny.push) {
        routerAny.push(href).catch(() => {
            // fallback to full navigation on error
            window.location.href = href;
        });
    } else {
        window.location.href = href;
    }
}
</script>

<style scoped>
.vp-bottombar {
    position: fixed;
    left: 0;
    right: 0;
    bottom: 0;
    height: 56px;
    display: flex;
    align-items: center;
    justify-content: space-around;
    background: var(--vp-c-surface, #fff);
    border-top: 1px solid var(--vp-c-divider);
    z-index: 1200;
    -webkit-backdrop-filter: blur(6px);
    backdrop-filter: blur(6px);
}

.vp-bottombar-item {
    color: var(--vp-c-text-1);
    text-decoration: none;
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    font-size: 12px;
    width: 72px;
}

.vp-bottombar-item .icon {
    font-size: 18px;
    line-height: 1;
}

.vp-bottombar-item.active {
    color: var(--vp-c-brand-1);
}

/* 默认隐藏，仅在小屏显示 */
@media (min-width: 640px) {
    .vp-bottombar {
        display: none;
    }
}

/* Scoped dark-mode rules to ensure they override global styles when needed */
@media (prefers-color-scheme: dark) {
    .vp-bottombar {
        background: rgba(6, 10, 13, 0.85);
        border-top-color: rgba(255, 255, 255, 0.06);
        color: #ddd;
    }

    .vp-bottombar-item {
        color: #ddd;
    }

    .vp-bottombar-item.active {
        color: #7dd3fc;
    }
}

/* Also apply when VitePress toggles a dark theme class on ancestor */
:deep(.theme-dark) .vp-bottombar,
:deep(.vp-theme-dark) .vp-bottombar {
    background: rgba(6, 10, 13, 0.85);
    border-top-color: rgba(255, 255, 255, 0.06);
    color: #ddd;
}

:deep(.theme-dark) .vp-bottombar-item,
:deep(.vp-theme-dark) .vp-bottombar-item {
    color: #ddd;
}

:deep(.theme-dark) .vp-bottombar-item.active,
:deep(.vp-theme-dark) .vp-bottombar-item.active {
    color: #7dd3fc;
}
</style>
