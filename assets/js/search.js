async function fetchData() {
    const response = await fetch('{{ site.baseurl }}/search.json');
    return await response.json();
  }
  
  document.getElementById('search-box').addEventListener('input', async function() {
    let query = this.value.toLowerCase();
    let resultsContainer = document.getElementById('search-results');
    resultsContainer.innerHTML = '';
  
    if (query.length < 2) return;
  
    let data = await fetchData();
    let results = data.filter(post => post.title.toLowerCase().includes(query));
  
    results.forEach(post => {
      let li = document.createElement('li');
      li.innerHTML = `<a href="${post.url}">${post.title}</a>`;
      resultsContainer.appendChild(li);
    });
  });