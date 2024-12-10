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
    id = parseInt(id);
    const location = locations.find(loc => loc.id === id);
    if (!location) return;

    // Get modal elements
    const modal = document.getElementById('editLocationModal');
    const closeBtn = modal.querySelector('.edit-modal-close');
    const cancelBtn = document.getElementById('editCancelBtn');
    const saveBtn = document.getElementById('editSaveBtn');

    // Fill form with location data
    document.getElementById('editName').value = location.name;
    document.getElementById('editType').value = location.type;
    document.getElementById('editAddress').value = location.address || '';
    document.getElementById('editPhone').value = location.phone || '';
    document.getElementById('editMembers').value = location.members || '';
    document.getElementById('editLat').value = location.lat;
    document.getElementById('editLng').value = location.lng;

    // Show modal
    modal.classList.add('show');
    document.body.style.overflow = 'hidden'; // Prevent background scrolling

    // Initialize edit map
    let editMap = L.map('editLocationMap').setView([location.lat, location.lng], 13);
    L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
        attribution: '© OpenStreetMap contributors'
    }).addTo(editMap);

    // Add draggable marker
    let marker = L.marker([location.lat, location.lng], {
        draggable: true
    }).addTo(editMap);

    // Update coordinates when marker is dragged
    marker.on('dragend', function(event) {
        let position = marker.getLatLng();
        document.getElementById('editLat').value = position.lat.toFixed(6);
        document.getElementById('editLng').value = position.lng.toFixed(6);
    });

    // Update marker when coordinates are manually changed
    document.getElementById('editLat').addEventListener('change', updateMarker);
    document.getElementById('editLng').addEventListener('change', updateMarker);

    function updateMarker() {
        let lat = parseFloat(document.getElementById('editLat').value);
        let lng = parseFloat(document.getElementById('editLng').value);
        if (!isNaN(lat) && !isNaN(lng)) {
            marker.setLatLng([lat, lng]);
            editMap.setView([lat, lng]);
        }
    }


    // Handle close button click
    closeBtn.onclick = function() {
        editMap.remove();
        closeEditModal();
    }

    // Handle cancel button click
    cancelBtn.onclick = function() {
        editMap.remove();
        closeEditModal();
    }

    // Handle save button click
    saveBtn.onclick = function() {
        editMap.remove();
        saveLocationChanges(id);
    }

    // Close modal when clicking outside
    window.onclick = function(event) {
        if (event.target === modal) {
            editMap.remove();
            closeEditModal();
        }
    }

    // Handle escape key
    document.addEventListener('keydown', function(event) {
        if (event.key === 'Escape') {
            editMap.remove();
            closeEditModal();
        }
    });

    // Fix map display issue by triggering a resize after modal is shown
    setTimeout(() => {
        editMap.invalidateSize();
    }, 100);    
}

function closeEditModal() {
    const modal = document.getElementById('editLocationModal');
    modal.classList.remove('show');
    document.body.style.overflow = 'auto'; // Restore scrolling
}

function saveLocationChanges(id) {
    const location = locations.find(loc => loc.id === id);
    if (!location) return;

    const marker = findMarkerById(id);
    if (!marker) return;

    // Get form values
    const name = document.getElementById('editName').value;
    const type = document.getElementById('editType').value;
    const address = document.getElementById('editAddress').value;
    const phone = document.getElementById('editPhone').value;
    const members = document.getElementById('editMembers').value;
    const lat = parseFloat(document.getElementById('editLat').value);
    const lng = parseFloat(document.getElementById('editLng').value);

    // Update location data
    Object.assign(location, {
        name,
        type,
        address,
        phone,
        members: members ? parseInt(members) : null,
        lat,
        lng
    });

    // Update marker position if coordinates changed
    if (location.lat !== marker.getLatLng().lat || location.lng !== marker.getLatLng().lng) {
        marker.setLatLng([location.lat, location.lng]);
    }

    // Update marker icon if type changed
    const icon = location.type === 'church' ? churchIcon : missionIcon;
    marker.setIcon(icon);

    // Update popup content
    marker.getPopup().setContent(createPopupContent(location));

    // Close modal
    closeEditModal();
}

// Helper function to find marker by location id
function findMarkerById(id) {
    let marker = null;
    map.eachLayer((layer) => {
        if (layer instanceof L.Marker && layer.location && layer.location.id === id) {
            marker = layer;
        }
    });
    return marker;
}

function getDirections(lat, lng) {
    window.open(`https://www.google.com/maps/dir/?api=1&destination=${lat},${lng}`, '_blank');
}

// Current location being viewed
let currentLocation = null;

// Function to show location details in sidebar
function showDetails(id) {
    id = parseInt(id);
    console.log(id);
    const location = locations.find(loc => loc.id === id);
    console.log(locations);
    console.log(location);
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
let locations = [];

// Function to fetch and display locations
async function fetchLocations() {
    try {
        const response = await fetch('/api/locations');
        const data = await response.json();
        
        // Clear existing markers
        churchLayer.clearLayers();
        missionLayer.clearLayers();
        
        // Store all locations
        locations = [...data.churches, ...data.done_mission_sites, ...data.proposed_mission_sites];
        
        // Add markers for each location
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

            // Store location data in marker for easy access
            marker.location = location;

            // Add click handler to show details
            marker.on('click', function() {
                console
                showDetails(location.id);
            });

            if (location.type === 'church') {
                churchLayer.addLayer(marker);
            } else {
                missionLayer.addLayer(marker);
            }
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
