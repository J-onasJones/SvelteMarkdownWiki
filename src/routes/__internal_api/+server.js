import { fetchMarkdownPages } from '$lib/utils';
import { json } from '@sveltejs/kit';

export const GET = async () => {
	const allPosts = await fetchMarkdownPages();
	// sort posts alphabetically
	allPosts.sort((a, b) => a.path.localeCompare(b.path));

	return json(allPosts);
};