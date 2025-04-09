class HomeConstants {
  String get title => "Pokédex";
  String get search => "Search";
  String get number => "Number";
  String get name => "Name";
  String get sortBy => "Search by:";
  String get cancel => "Cancelar";
  String get imgUrl => "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/imgUrl.png";
  String get pokeballPath => "assets/images/svg/pokeball.svg";
  String get filterTextlPath => "assets/images/svg/textFilter.svg";
  String get error => "Error";
  String get notFound => "No Pokemons found.";
  String get apiPokemon => "https://pokeapi.co/api/v2/pokemon/";
  String get apiSpeciesPokemon => "https://pokeapi.co/api/v2/pokemon-species/";
  String get about => "About";
  String get weight => "Weight";
  String get height => "Height";
  String get moves => "Moves";
  String get baseStats => "Base Stats";

  // Mapa de colores para cada tipo de Pokémon
  Map<String, String> typeColors = {
    'grass': '#78C850',  // verde para Planta
    'poison': '#A040A0', // morado para Veneno
    'fire': '#F08030',   // rojo anaranjado para Fuego
    'water': '#6890F0',  // azul para Agua
    'electric': '#F8D030', // amarillo para Eléctrico
    'bug': '#A8B820',    // verde para Bicho
    'normal': '#A8A878', // gris para Normal
    'fighting': '#C03028', // rojo para Lucha
    'psychic': '#F85888', // rosa para Psíquico
    'ghost': '#705898',  // morado oscuro para Fantasma
    'dark': '#705848',   // gris oscuro para Siniestro
    'fairy': '#EE99AC',  // rosa para Hada
    // Agregar más colores según sea necesario
  };
}
