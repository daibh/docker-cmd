FROM mcr.microsoft.com/dotnet/core/aspnet:2.2
ARG source
WORKDIR /app
ENV ASPNETCORE_URLS http://+:80
EXPOSE 80

COPY ${source:-obj/Docker/publish} .
ENTRYPOINT ["dotnet", "App2.dll"]
