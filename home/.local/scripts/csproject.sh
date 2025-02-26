mkdir $1
cd $1

mkdir src
mkdir src/resources
mkdir src/resources/embedded
mkdir src/resources/copy
mkdir build
mkdir docs

echo '<Project Sdk="Microsoft.NET.Sdk">

    <PropertyGroup>
        <OutputType>Exe</OutputType>
        <TargetFramework>net8.0</TargetFramework>
        <ImplicitUsings>enable</ImplicitUsings>
        <Nullable>enable</Nullable>
    </PropertyGroup>

    <ItemGroup>
      <EmbeddedResource Include="resources/embedded/*" />
    </ItemGroup>

    <ItemGroup>
      <Content Include="resources/copy/*">
        <CopyToOutputDirectory>Always</CopyToOutputDirectory>
      </Content>
    </ItemGroup>

</Project>' > src/$1.csproj

echo "<Project>
    <PropertyGroup>
        <BaseOutputPath>../build/bin</BaseOutputPath>
        <BaseIntermediateOutputPath>../build/obj</BaseIntermediateOutputPath>
    </PropertyGroup>
</Project>
" > Directory.Build.props

dotnet new sln
dotnet sln $1.sln add src/$1.csproj

echo "namespace ${1};

class Program {
    static void Main(string[] args) {

    }
}" > src/Program.cs
