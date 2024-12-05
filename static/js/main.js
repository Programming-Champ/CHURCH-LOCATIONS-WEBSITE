// Initialize map
const map = L.map('map').setView([0.0236, 37.9062], 6); // Kenya coordinates

L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
    attribution: ' OpenStreetMap contributors'
}).addTo(map);

// Layer groups for different markers
const churchLayer = L.layerGroup().addTo(map);
const missionLayer = L.layerGroup().addTo(map);
const influenceLayer = L.layerGroup().addTo(map);

// Custom markers
const churchIcon = L.divIcon({
    html: '<i class="fas fa-map-pin" style="color: #007acc; font-size: 24px;"></i>',
    className: 'custom-pin',
    iconSize: [24, 24],
    iconAnchor: [12, 24],
    popupAnchor: [0, -24]
});

const missionIcon = L.divIcon({
    html: '<i class="fas fa-map-pin" style="color: #e74c3c; font-size: 24px;"></i>',
    className: 'custom-pin',
    iconSize: [24, 24],
    iconAnchor: [12, 24],
    popupAnchor: [0, -24]
});

// Fetch and display locations
async function fetchLocations() {
    try {
        const response = await fetch('/api/locations');
        const data = await response.json();
        
        // Clear existing markers
        churchLayer.clearLayers();
        missionLayer.clearLayers();
        
        // Add churches
        data.churches.forEach(church => {
            L.marker([church.lat, church.long], {icon: churchIcon})
                .bindPopup(`<b>${church.name}</b><br>Church`)
                .addTo(churchLayer);
        });
        
        // Add mission sites
        data.done_mission_sites.forEach(site => {
            L.marker([site.lat, site.long], {icon: missionIcon})
                .bindPopup(`<b>${site.name}</b><br>Mission Site`)
                .addTo(missionLayer);
        });
    } catch (error) {
        console.error('Error fetching locations:', error);
    }
}

// Toggle event listeners
document.getElementById('churches-toggle').addEventListener('change', function(e) {
    if (e.target.checked) {
        map.addLayer(churchLayer);
    } else {
        map.removeLayer(churchLayer);
    }
});

document.getElementById('mission-sites-toggle').addEventListener('change', function(e) {
    if (e.target.checked) {
        map.addLayer(missionLayer);
    } else {
        map.removeLayer(missionLayer);
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

// Map style changes
const mapStyleSelect = document.getElementById('map-style');

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
            attribution: ' OpenStreetMap contributors'
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

// Sidebar functionality
document.addEventListener('DOMContentLoaded', () => {
    const sidebar = document.querySelector('.sidebar');
    const tabButtons = document.querySelectorAll('.tab-button');
    const panels = document.querySelectorAll('.panel-content');

    // Handle tab switching
    tabButtons.forEach(button => {
        button.addEventListener('click', (e) => {
            e.stopPropagation(); // Prevent click from bubbling to document
            
            const wasActive = button.classList.contains('active');
            
            // Update active states
            tabButtons.forEach(btn => btn.classList.remove('active'));
            panels.forEach(panel => panel.classList.remove('active'));
            
            if (!wasActive) {
                button.classList.add('active');
                const tabId = button.getAttribute('data-tab');
                const panel = document.getElementById(`${tabId}-panel`);
                
                if (panel) {
                    panel.classList.add('active');
                    sidebar.classList.add('expanded');
                }
            } else {
                sidebar.classList.remove('expanded');
            }
        });
    });

    // Close sidebar when clicking outside
    document.addEventListener('click', (e) => {
        if (!sidebar.contains(e.target)) {
            sidebar.classList.remove('expanded');
            tabButtons.forEach(btn => btn.classList.remove('active'));
            panels.forEach(panel => panel.classList.remove('active'));
        }
    });
});

// Initialize the map with data
fetchLocations();
