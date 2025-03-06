// This class represents attributes of informational content.
class InformationalContent {
  final String title;
  final String description;

  const InformationalContent({required this.title, required this.description});
}

const List<InformationalContent> informationalContents = <InformationalContent>[
  InformationalContent(
    title: 'Coffee dose',
    description:
        'Getting the coffee dose right is crucial for a well-balanced and flavorful brew. The dose refers to the amount of ground coffee used in a brewing method, and even small adjustments can greatly impact the final taste.\n\nUsing too little coffee can lead to under-extraction, resulting in a weak and sour cup. On the other hand, too much coffee can cause over-extraction, making the brew bitter and overpowering.\n\nThe ideal dose varies depending on the brewing method and personal preference. Espresso typically requires between 14-20 grams, while pour-over and French press methods follow a specific coffee-to-water ratio to ensure proper extraction.\n\nConsistency in dosing is key to achieving reliable results, and using a digital scale helps maintain precision. Different coffee beans may also require slight adjustments in dose due to variations in density and solubility.\n\nExperimenting with the dose allows home baristas to refine their brewing process and discover the perfect balance of strength, body, and flavor. With careful measurement and attention to detail, every cup can be tailored to personal taste preferences, making coffee brewing a rewarding experience.',
  ),
  InformationalContent(
    title: 'Grind size',
    description:
        'Grind size plays a crucial role in coffee extraction, affecting the flavor, aroma, and strength of your brew. Choosing the right grind size ensures balanced extraction, preventing coffee from being too bitter or too weak.\n\nEach brewing method requires a specific grind consistency to optimize water flow and contact time with the coffee grounds. Espresso demands a fine grind to create the necessary resistance for proper extraction, while pour-over methods benefit from a medium grind that allows for even saturation. French press brewing requires a coarse grind to prevent over-extraction and sediment in the final cup.\n\nAdjusting your grind size can correct common coffee issues. If your coffee tastes too sour and weak, the grind may be too coarse, leading to under-extraction. If it’s bitter and overpowering, the grind is likely too fine, resulting in over-extraction.\n\nInvesting in a high-quality burr grinder enables precise grind adjustments, helping you fine-tune your coffee for the best possible flavor. Experimenting with grind size based on your brewing method and taste preference is key to achieving a consistently great cup of coffee.',
  ),
  InformationalContent(
    title: 'Brewing',
    description:
        'Brewing coffee is both a science and an art, requiring the right balance of time, temperature, and technique. Each brewing method, from espresso to pour-over to French press, extracts flavors differently.\n\nUnderstanding the nuances of brewing allows you to control the taste, strength, and clarity of your coffee. The brewing process begins with proper coffee-to-water ratios, ensuring a balanced extraction.\n\nToo much water with too little coffee results in a weak, under-extracted cup, while too little water can lead to a bitter, over-extracted brew. The agitation of coffee grounds also plays a role, influencing how flavors develop during extraction.\n\nDifferent brewing devices require specific techniques. Espresso machines rely on pressure to extract intense flavors in seconds, while pour-over methods use slow, steady pouring for clarity and complexity. French press brewing involves immersion, allowing full-bodied flavors to develop.\n\nRegardless of the method, consistency is key. By refining your technique and experimenting with variables like grind size, water temperature, and brewing time, you can achieve a coffee experience that matches your taste preferences',
  ),
  InformationalContent(
    title: 'Temparature',
    description:
        'Water temperature is a critical factor in coffee brewing, influencing extraction and flavor balance. The ideal range for brewing coffee is between 195°F and 205°F (90°C to 96°C). Within this range, water effectively extracts the desirable flavors from coffee grounds without drawing out excessive bitterness.\n\nIf the water is too hot, it can over-extract compounds, leading to a burnt or bitter taste. If it’s too cool, under-extraction occurs, resulting in a weak and sour brew.\n\nDifferent brewing methods require precise temperature control. Espresso machines typically maintain consistent temperatures, ensuring optimal extraction in a short time frame. Manual methods like pour-over and French press give more control over temperature, allowing adjustments based on the coffee’s roast level and grind size.\n\nLight roasts benefit from slightly higher temperatures to extract complex flavors, while dark roasts perform better at lower temperatures to avoid excessive bitterness.\n\nUsing a thermometer or a temperature-controlled kettle helps maintain accuracy, ensuring that every brew is optimized for maximum flavor. Understanding and controlling temperature can elevate your coffee experience, making each cup more enjoyable.',
  ),
  InformationalContent(
    title: 'Water',
    description:
        'Water quality is often overlooked in home coffee brewing, yet it plays a fundamental role in the final taste. Since coffee is over 98% water, the minerals and composition of the water used directly impact flavor and extraction.\n\nThe best brewing water is clean, filtered, and free from impurities like chlorine, which can introduce unwanted flavors. Hard water, rich in minerals like calcium and magnesium, can enhance extraction and improve taste, but excessive hardness may lead to scale buildup in coffee machines.\n\nConversely, soft water can result in flat, lifeless coffee due to inadequate extraction of essential coffee compounds. Using filtered or bottled water with balanced mineral content ensures consistent and enjoyable results.\n\nTemperature stability is also crucial; water should be heated to the optimal range of 195°F to 205°F (90°C to 96°C) to extract flavors efficiently.\n\nExperimenting with different water sources and monitoring mineral content can make a significant difference in coffee quality, bringing out the full complexity and richness of your beans. Paying attention to water quality ensures that every cup of coffee reaches its full potential.',
  ),
];
