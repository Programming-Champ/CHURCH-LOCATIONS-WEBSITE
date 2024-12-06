// Initialize map
const map = L.map('map').setView([0.0236, 37.9062], 6); // Kenya coordinates

// Layer groups for different markers
const churchLayer = L.layerGroup().addTo(map);
const missionLayer = L.layerGroup().addTo(map);
const influenceLayer = L.layerGroup().addTo(map);

// Custom marker icons
const churchIcon = L.divIcon({
    html: '<i class="fas fa-location-dot" style="color: #007acc; font-size: 32px; text-shadow: 2px 2px 2px rgba(0,0,0,0.2);"></i>',
    className: 'custom-pin',
    iconSize: [32, 32],
    iconAnchor: [16, 32],
    popupAnchor: [0, -32]
});

const missionIcon = L.divIcon({
    html: '<i class="fas fa-location-dot" style="color: #e74c3c; font-size: 32px; text-shadow: 2px 2px 2px rgba(0,0,0,0.2);"></i>',
    className: 'custom-pin',
    iconSize: [32, 32],
    iconAnchor: [16, 32],
    popupAnchor: [0, -32]
});

// Function to create popup content
function createPopupContent(location) {
    // Determine color badge based on location type
    const typeBadgeClass = location.type === 'church' 
        ? 'badge-primary' 
        : 'badge-secondary';

    return `
        <div class="popup-content">
            <div class="popup-name">
                <div class="popup-location-name mb-3">
                    <h3 class="mb-0" style="font-size: 1.5rem;">${location.name}</h3>
                </div>
                <hr class="my-3">
                <div class="popup-location-type">
                    <span class="badge ${typeBadgeClass} text-uppercase small">
                        ${location.type}
                    </span>
                </div>
            </div>
            
            <div class="popup-details">
                ${location.address ? `
                <div class="popup-detail d-flex align-items-center" style="margin-top: 5px; margin-bottom: 5px;">
                    <i class="fas fa-map-marker-alt mr-3 text-muted"></i>
                    <span>${location.address}</span>
                </div>
                ` : ''}
                
                ${location.phone ? `
                <div class="popup-detail d-flex align-items-center" style="margin-top: 5px; margin-bottom: 5px;">
                    <i class="fas fa-phone mr-3 text-muted"></i>
                    <span>${location.phone}</span>
                </div>
                ` : ''}
                
                ${location.members ? `
                <div class="popup-detail d-flex align-items-center" style="margin-top: 5px; margin-bottom: 5px;">
                    <i class="fas fa-users mr-3 text-muted"></i>
                    <span>${location.members} Members</span>
                </div>
                ` : ''}
            </div>
            
            <div class="popup-actions mt-4 d-flex justify-content-between">
                <button class="popup-action-btn btn btn-sm btn-outline-secondary mr-1" onclick="editLocation('${location.id}')">
                    <i class="fas fa-edit mr-1"></i>Edit
                </button>
                <button class="popup-action-btn btn btn-sm btn-outline-primary mr-1" onclick="getDirections(${location.lat}, ${location.lng})">
                    <i class="fas fa-directions mr-1"></i>Directions
                </button>
                <button class="popup-action-btn details-btn btn btn-sm btn-info" data-id="${location.id}">
                    <i class="fas fa-info-circle mr-1"></i>Details
                </button>
            </div>
        </div>
    `;
}

// Action functions
function editLocation(id) {
    // TODO: Implement edit functionality
    console.log('Edit location:', id);
}

function getDirections(lat, lng) {
    window.open(`https://www.google.com/maps/dir/?api=1&destination=${lat},${lng}`, '_blank');
}

// Current location being viewed
let currentLocation = null;

// Function to show location details in sidebar
function showDetails(id) {
    const location = locations.find(loc => loc.id === id);
    if (!location) return;

    currentLocation = location;
    
    // Ensure sidebar is expanded
    const sidebar = document.querySelector('.sidebar');
    if (sidebar) {
        sidebar.classList.add('expanded');
    }
    
    // Activate details tab
    const detailsTab = document.getElementById('details-tab-button');
    const detailsPanel = document.getElementById('details-panel');
    
    if (detailsTab && detailsPanel) {
        // Deactivate other tabs and panels
        document.querySelectorAll('.tab-button').forEach(btn => btn.classList.remove('active'));
        document.querySelectorAll('.panel-content').forEach(panel => panel.classList.remove('active'));
        
        // Activate details tab and panel
        detailsTab.classList.add('active');
        detailsPanel.classList.add('active');
    }
    
    // Update details panel content
    document.getElementById('details-name').textContent = location.name;
    document.getElementById('details-type').textContent = location.type.charAt(0).toUpperCase() + location.type.slice(1);
    document.getElementById('details-phone').textContent = location.phone || 'Not available';
    document.getElementById('details-address').textContent = location.address || 'Not available';
    
    // Update members if exists
    const membersElement = document.getElementById('details-members');
    if (membersElement) {
        membersElement.textContent = location.members ? `${location.members} Members` : 'Not available';
    }
    
    // Show description based on type
    const descriptionElement = document.getElementById('details-description');
    if (descriptionElement) {
        let description = '';
        if (location.type === 'church') {
            description = `${location.name} is a Seventh-day Adventist church located in ${location.address}. ` +
                         `The church has a congregation of ${location.members} members and offers regular services ` +
                         `including Sabbath School, Divine Service, and afternoon programs.`;
        } else {
            description = `${location.name} is an administrative office of the Seventh-day Adventist Church ` +
                         `located in ${location.address}. It oversees church operations and mission work in the region.`;
        }
        descriptionElement.textContent = description;
    }
}

// Function to get directions from details panel
function getDirectionsFromDetails() {
    if (currentLocation) {
        getDirections(currentLocation.lat, currentLocation.lng);
    }
}

// Function to edit from details panel
function editFromDetails() {
    if (currentLocation) {
        editLocation(currentLocation.id);
    }
}

// Store locations globally for access
let locations = [
    { 
        id: '1',
        type: 'church',
        name: 'Nairobi Central SDA Church',
        lat: -1.2897,
        lng: 36.8168,
        members: 3500,
        address: 'Valley Road, Nairobi',
        phone: '+254 20 2724017'
    },
    {
        id: '2',
        type: 'church',
        name: 'Maxwell SDA Church',
        lat: -1.2953,
        lng: 36.7672,
        members: 2800,
        address: 'Nairobi Adventist University, Magadi Road',
        phone: '+254 20 2679462'
    },
    {
        id: '3',
        type: 'church',
        name: 'Karengata SDA Church',
        lat: -1.3178,
        lng: 36.8162,
        members: 2000,
        address: 'Karengata Road, Off Langata Road',
        phone: '+254 722 123456'
    },
    {
        id: '4',
        type: 'church',
        name: 'New Life SDA Church',
        lat: -1.2706,
        lng: 36.8219,
        members: 1500,
        address: 'Ngong Road, Nairobi',
        phone: '+254 733 123456'
    },
    {
        id: '5',
        type: 'mission',
        name: 'East Kenya Union Conference',
        lat: -1.2897,
        lng: 36.8214,
        members: null,
        address: 'East Kenya Union Conference, Valley Road',
        phone: '+254 20 2714033'
    },
    {
        id: '6',
        type: 'church',
        name: 'Kisumu Central SDA Church',
        lat: -0.0918,
        lng: 34.7571,
        members: 1800,
        address: 'Oginga Odinga Road, Kisumu',
        phone: '+254 57 2020238'
    },
    {
        id: '7',
        type: 'church',
        name: 'Mombasa Central SDA Church',
        lat: -4.0435,
        lng: 39.6682,
        members: 1200,
        address: 'Kenyatta Avenue, Mombasa',
        phone: '+254 41 2224827'
    },
    {
        id: '8',
        type: 'mission',
        name: 'Kenya Lake Conference',
        lat: -0.0905,
        lng: 34.7516,
        members: null,
        address: 'Kenya Lake Conference, Kisumu',
        phone: '+254 57 2021714'
    },
    {
        id: '9',
        type: 'church',
        name: 'Eldoret Central SDA Church',
        lat: 0.5143,
        lng: 35.2698,
        members: 1500,
        address: 'Uganda Road, Eldoret',
        phone: '+254 53 2061248'
    },
    {
        id: '10',
        type: 'mission',
        name: 'Central Kenya Conference',
        lat: -1.2860,
        lng: 36.8168,
        members: null,
        address: 'Central Kenya Conference, Nairobi',
        phone: '+254 20 2715822'
    }
];

// Function to fetch and display locations
function fetchLocations() {
    locations.forEach(location => {
        const marker = L.marker(
            [location.lat, location.lng],
            { 
                icon: location.type === 'church' ? churchIcon : missionIcon
            }
        ).bindPopup(
            createPopupContent(location),
            { 
                className: 'custom-popup',
                maxWidth: 300,
                minWidth: 300
            }
        );

        if (location.type === 'church') {
            churchLayer.addLayer(marker);
        } else {
            missionLayer.addLayer(marker);
        }
    });
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

document.addEventListener('DOMContentLoaded', function() {
    // Map tile layer selection
    function setMapStyle(style) {
        // Remove existing tile layers
        map.eachLayer(function(layer) {
            if (layer instanceof L.TileLayer) {
                map.removeLayer(layer);
            }
        });

        // Add new tile layer based on selected style
        if (style === 'satellite') {
            L.tileLayer('https://server.arcgisonline.com/ArcGIS/rest/services/World_Imagery/MapServer/tile/{z}/{y}/{x}', {
                attribution: 'Tiles &copy; Esri &mdash; Source: Esri, i-cubed, USDA, USGS, AEX, GeoEye, Getmapping, Aerogrid, IGN, IGP, UPR-EGP, and the GIS User Community'
            }).addTo(map);
        } else if (style === 'terrain') {
            L.tileLayer('https://{s}.tile.opentopomap.org/{z}/{x}/{y}.png', {
                attribution: 'Map data: &copy; OpenStreetMap contributors, SRTM | Map style: &copy; OpenTopoMap'
            }).addTo(map);
        } else {
            // Default to streets/standard
            L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
                attribution: ' OpenStreetMap contributors'
            }).addTo(map);
        }
    }

    // Sidebar functionality
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

    // Initialize locations
    fetchLocations();
    setMapStyle('standard');

    // Add event listener for details buttons
    document.addEventListener('click', (e) => {
        const detailsBtn = e.target.closest('.details-btn');
        if (detailsBtn) {
            const locationId = detailsBtn.getAttribute('data-id');
            showDetails(locationId);
        }
    });
});
