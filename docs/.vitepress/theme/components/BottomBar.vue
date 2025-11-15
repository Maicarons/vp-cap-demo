<template>
    <nav class="fixed left-0 right-0 bottom-0 h-14 flex items-center justify-around bg-$vp-c-surface border-t border-$vp-c-divider z-1200 backdrop-blur-sm md:hidden" role="navigation" aria-label="Bottom navigation">
        <a v-for="item in items" :key="item.to" :href="item.to" 
           class="flex flex-col items-center justify-center text-xs w-18 text-$vp-c-text-1 no-underline"
           :class="{ 'text-$vp-c-brand-1': isActive(item) }" 
           @click="onClick">
            <span class="text-lg leading-none" aria-hidden="true">
                <span :class="'i-ep-' + item.icon"></span>
            </span>
            <span class="label">{{ item.label }}</span>
        </a>
    </nav>
</template>

<script setup lang="ts">
import { useRoute, useRouter } from "vitepress";
import { bottomNavItems } from "../config/bottomNavItems";

const route = useRoute();
const router = useRouter();

const items = bottomNavItems;

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
/* Scoped dark-mode rules to ensure they override global styles when needed */
@media (prefers-color-scheme: dark) {
    nav {
        background: rgba(6, 10, 13, 0.85);
        border-top-color: rgba(255, 255, 255, 0.06);
        color: #ddd;
    }

    a {
        color: #ddd;
    }

    a.text-\$vp-c-brand-1 {
        color: #7dd3fc;
    }
}

/* Also apply when VitePress toggles a dark theme class on ancestor */
:deep(.theme-dark) nav,
:deep(.vp-theme-dark) nav {
    background: rgba(6, 10, 13, 0.85);
    border-top-color: rgba(255, 255, 255, 0.06);
    color: #ddd;
}

:deep(.theme-dark) a,
:deep(.vp-theme-dark) a {
    color: #ddd;
}

:deep(.theme-dark) a.text-\$vp-c-brand-1,
:deep(.vp-theme-dark) a.text-\$vp-c-brand-1 {
    color: #7dd3fc;
}
</style>