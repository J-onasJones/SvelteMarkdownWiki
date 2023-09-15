<script>
	import Header from '$lib/components/Header.svelte';
    import Footer from '$lib/components/Footer.svelte';
    import Navbar from '$lib/components/Navbar.svelte';
    import '$lib/styles/style.css';
</script>

<Header />

<div class="container">
    <div class="column navbar"><Navbar /></div>
    <div class="column content">
        <main>
            <slot />
        </main>
    </div>
</div>




<Footer />
