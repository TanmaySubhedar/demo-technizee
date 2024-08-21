<script>
    import { onMount } from 'svelte';
    import { supabase } from '$lib/supabaseClient'; // Adjust path as necessary
  
    let products = [];
    let errorMessage = '';
  
    onMount(async () => {
      try {
        const { data, error } = await supabase.from('products').select('id, product_name, product_desc, price, img_url');
  
        if (error) {
          errorMessage = 'Error fetching products: ' + error.message;
          console.error(error);
        } else {
          products = data;
        }
      } catch (err) {
        errorMessage = 'Unexpected error: ' + err.message;
        console.error(err);
      }
    });
  </script>
  
  {#if errorMessage}
    <p class="text-red-500">{errorMessage}</p>
  {/if}
  
  {#if products.length === 0}
    <p>No products found.</p>
  {/if}
  
  <div class="flex flex-wrap gap-4 p-6 justify-center">
    {#each products as product}
      <div class="border border-gray-300 rounded-lg  shadow-lg hover:shadow-xl transform hover:scale-105 transition-transform duration-300 ease-in-out flex flex-col max-w-xs mx-2 bg-green-500">
        <div class="overflow-hidden rounded-t-lg px-2 py-2">
          <img src={product.img_url || 'default-image.jpg'} alt={product.product_name} class="w-full object-cover h-full " />
        </div>
        <div class="flex-grow p-4 flex flex-col justify-between">
          <h2 class="text-lg text-white font-semibold mb-2 text-center truncate">{product.product_name}</h2>
          <p class="text-white mb-2 text-center truncate">{product.product_desc}</p>
          <p class="text-xl font-bold text-white text-center">Rs. {product.price}</p>
        </div>
      </div>
    {/each}
  </div>
  
  
  