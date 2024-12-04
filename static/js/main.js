// Initialize map
const map = L.map('map').setView([-26.2041, 28.0473], 10); // Centered on Johannesburg

// Add OpenStreetMap tile layer
L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
    attribution: '© OpenStreetMap contributors'
}).addTo(map);

// Layer groups for different markers
const churchesLayer = L.layerGroup().addTo(map);
const missionSitesLayer = L.layerGroup().addTo(map);
const influenceLayer = L.layerGroup().addTo(map);

// Custom markers
const churchIcon = L.icon({
    iconUrl: '/static/images/church-icon.png',
    iconSize: [32, 32],
    iconAnchor: [16, 32],
    popupAnchor: [0, -32]
});

const missionIcon = L.icon({
    iconUrl: '/static/images/mission-icon.png',
    iconSize: [32, 32],
    iconAnchor: [16, 32],
    popupAnchor: [0, -32]
});

// Fetch and display locations
async function fetchLocations() {
    try {
        const response = await fetch('/api/locations');
        const data = await response.json();
        
        // Clear existing markers
        churchesLayer.clearLayers();
        missionSitesLayer.clearLayers();
        
        // Add churches
        data.churches.forEach(church => {
            L.marker([church.lat, church.long], {icon: churchIcon})
                .bindPopup(`<b>${church.name}</b><br>Church`)
                .addTo(churchesLayer);
        });
        
        // Add mission sites
        data.done_mission_sites.forEach(site => {
            L.marker([site.lat, site.long], {icon: missionIcon})
                .bindPopup(`<b>${site.name}</b><br>Mission Site`)
                .addTo(missionSitesLayer);
        });
    } catch (error) {
        console.error('Error fetching locations:', error);
    }
}

// Toggle event listeners
document.getElementById('churches-toggle').addEventListener('change', function(e) {
    if (e.target.checked) {
        map.addLayer(churchesLayer);
    } else {
        map.removeLayer(churchesLayer);
    }
});

document.getElementById('mission-sites-toggle').addEventListener('change', function(e) {
    if (e.target.checked) {
        map.addLayer(missionSitesLayer);
    } else {
        map.removeLayer(missionSitesLayer);
    }
});

document.getElementById('influence-toggle').addEventListener('change', function(e) {
    if (e.target.checked) {
        // TODO: Add logic for displaying area of influence
        map.addLayer(influenceLayer);
    } else {
        map.removeLayer(influenceLayer);
    }
});

// Panel functionality
const hamburgerMenu = document.getElementById('hamburger-menu');
const rightPanel = document.getElementById('right-panel');
const closePanel = document.getElementById('close-panel');
const mapStyleSelect = document.getElementById('map-style');

// Toggle panel
hamburgerMenu.addEventListener('click', () => {
    rightPanel.classList.add('open');
});

closePanel.addEventListener('click', () => {
    rightPanel.classList.remove('open');
});

// Close panel when clicking outside
document.addEventListener('click', (e) => {
    if (!rightPanel.contains(e.target) && 
        !hamburgerMenu.contains(e.target) && 
        rightPanel.classList.contains('open')) {
        rightPanel.classList.remove('open');
    }
});

// Map style changes
mapStyleSelect.addEventListener('change', (e) => {
    const style = e.target.value;
    if (style === 'satellite') {
        L.tileLayer('https://server.arcgisonline.com/ArcGIS/rest/services/World_Imagery/MapServer/tile/{z}/{y}/{x}', {
            attribution: 'Tiles &copy; Esri &mdash; Source: Esri, i-cubed, USDA, USGS, AEX, GeoEye, Getmapping, Aerogrid, IGN, IGP, UPR-EGP, and the GIS User Community'
        }).addTo(map);
    } else if (style === 'terrain') {
        L.tileLayer('https://{s}.tile.opentopomap.org/{z}/{x}/{y}.png', {
            attribution: 'Map data: &copy; OpenStreetMap contributors, SRTM | Map style: &copy; OpenTopoMap'
        }).addTo(map);
    } else {
        L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
            attribution: '© OpenStreetMap contributors'
        }).addTo(map);
    }
});

// Search functionality
const searchInput = document.getElementById('search-input');
const searchButton = document.getElementById('search-button');

function performSearch() {
    const searchTerm = searchInput.value.toLowerCase();
    // TODO: Implement search logic
}

searchButton.addEventListener('click', performSearch);
searchInput.addEventListener('keypress', function(e) {
    if (e.key === 'Enter') {
        performSearch();
    }
});

// Initialize the map with data
fetchLocations();
