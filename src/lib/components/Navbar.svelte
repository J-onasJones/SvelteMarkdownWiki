<script>
	let data = import.meta.glob('/src/routes/**/+page.md');
	let paths = data;
  
	function buildHierarchy(paths) {
		const nestedList = {};
		let fixedpaths = [];
		let fixedpaths2 = [];
		fixedpaths = Object.keys(paths);
		fixedpaths.forEach((path) => {
			const fixedpath = path.replace("/+page.md", "").replace("/src/routes", "");
			fixedpaths2.push(fixedpath);
		});
		fixedpaths2.forEach((folder) => {
			const parts = folder.split('/').filter(Boolean);
			let currentNode = nestedList;

			parts.forEach((part) => {
				if (!currentNode[part]) {
				currentNode[part] = {};
				}
				currentNode = currentNode[part];
			});
		});

		return nestedList;
	}

  const nestedFolders = buildHierarchy(paths);

  // Helper function to recursively render the nested list
  function renderNestedList(node, prefix = '') {
    return Object.keys(node).map((key) => {
      const fullPath = `${prefix}/${key}`;
      return `<li><a href="${fullPath}">${key}</a><ul>${renderNestedList(node[key], fullPath)}</ul></li>`;
    }).join('');
  }

  const renderedList = `<ul>${renderNestedList(nestedFolders)}</ul>`;
</script>

<div class="container">
	<div class="row">
		<div class="col-md-12">
			<h1>Pages</h1>
			{@html renderedList}
		</div>
	</div>
</div>