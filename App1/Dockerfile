FROM mcr.microsoft.com/dotnet/core/aspnet:2.2
ARG source
WORKDIR /app
ENV ASPNETCORE_URLS http://+:81
EXPOSE 81

COPY ${source:-obj/Docker/publish} .
ENTRYPOINT ["dotnet", "App1.dll"]
