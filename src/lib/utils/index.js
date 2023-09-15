export const fetchMarkdownPages = async () => {
	const allPageFiles = import.meta.glob('/src/routes/**/+page.md');
	const iterablePageFiles = Object.entries(allPageFiles);
	const allPages = await Promise.all(
		iterablePageFiles.map(async ([path]) => {
			const pagePath = path.slice(11, -3);

			return {
				path: pagePath
			};
		})
	);

	return allPages;
};