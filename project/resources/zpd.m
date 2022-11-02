function zpd(z,p)

z = z(:);
p = p(:);
if (~isempty(z) && ~isempty(p))
    m = max(max(abs(z),max(abs(p))));
elseif (~isempty(z))
    m = max(abs(z));
elseif (~isempty(p))
    m = max(abs(p));
else
    m = 1;
end
figure
[hz,hp,ht] = zplane(z,p);
hold on
hz.LineWidth = 1.5;
hz.MarkerSize = 15;
hp.MarkerSize = 15;
set(gca,'FontSize',18);
hp.LineWidth = 1.5;
hz.Color = [0 0 0];
hp.Color = [0 0 0];
xlim([-1.3*m,1.3*m]);
ylim([-1.3*m,1.3*m]);
end