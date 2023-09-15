//import adapter from '@sveltejs/adapter-auto';
import sveltePreprocess from 'svelte-preprocess';
import adapter from '@sveltejs/adapter-cloudflare';
import { mdsvex } from 'mdsvex';

/** @type {import('@sveltejs/kit').Config} */
const config = {
	kit: {
		adapter: adapter()
	},
  	extensions: ['.svelte', '.md'],
  	preprocess: [
		//sveltePreprocess(),
		mdsvex({
			extensions: ['.md']
		})
	]
};

export default config;
