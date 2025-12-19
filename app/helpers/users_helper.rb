module UsersHelper
end

=begin
# Dist = sqrt((K1*delta(phi))^2+(k2*delta(lambda))^2)
let user_latlng = num
let neigh_latlng = other_num


# Calculate the middle latitude between the two reference points by averaging the two latitudes as follows:
# ML = (LAT1dd + LAT2dd) ÷ 2

ML = (user_lat + neigh_lat) / 2;

# (3) Calculate the number of kilometers per degree latitude difference
# for the middle latitude as follows:
# KPDlat = 111.13209 - 0.56605 cos(2ML) +
# 0.00120 cos(4ML)

KpDLat = 111.13209 - 0.56605 * cos(2*ML) + 0.00120 * cos(4*ML)

# (4) Calculate the number of kilometers per degree longitude difference
# for the middle latitude as follows:
# KPDlon = 111.41513 cos(ML) - 0.09455
# cos(3ML) + 0.00012 cos(5ML)

KpDLon = 111.41513 * cos(ML) - 0.09455 * cos(3*ML) + 0.00012 * cos(5*ML)

# (5) Calculate the North-South distance in kilometers as follows:
# NS = KPDlat(LAT1dd¥LAT2dd)

NSDist = KpDLat * (user_lat - neigh_lat)

# (6) Calculate the East-West distance
# in kilometers as follows:
# EW = KPDlon(LON1dd¥LON2dd)

EWDist = KpDLon * (user_lng - neigh_lng)

# (7) Calculate the distance between
# the two reference points by taking the
# square root of the sum of the squares of
# the East-West and North-South distances as follows:
# DIST = (NS2 + EW2)0.5

DIST = sqrt(NSDist^2 + EWDist^2)

# (8) Round the distance to the nearest
# kilometer.
=end