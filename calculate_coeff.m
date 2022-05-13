function [b a] = calculate_coeff(nc)
% Αυτή η συνάρτηση υπολογίζει τους παράγωντες για τα φίλτρα
% σύμφωνα με το είδος του φίλτρου
global filts_type
global f
global Fs
global G


switch filts_type(nc)
    case 1
        [b a]=lowshelf(G(nc),f(nc),Fs);
    case 2
        [b a]=peaking(G(nc),f(nc),Fs);
    case 3
        [b a]=highself(G(nc),f(nc),Fs);
end





