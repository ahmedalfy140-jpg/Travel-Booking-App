import 'package:travel_booking_app/features/destinations/domain/entities/destination.dart';

class DestinationLocalDataSource {
  List< DestinationEntity> getDestinations(){
       return const [
      DestinationEntity(
        id: 'bali',
        name: 'Bali',
        country: 'Indonesia',
        description: 'Tropical paradise and beautiful beaches.',
        imageUrl: 'https://images.unsplash.com/photo-1537996194471-e657df975ab4',
        latitude: -8.4095,
        longitude: 115.1889,
      ),
      DestinationEntity(
        id: 'switzerland',
        name: 'Swiss Alps',
        country: 'Switzerland',
        description: 'Mountains, lakes and breathtaking nature.',
        imageUrl: 'https://images.unsplash.com/photo-1531366936337-7c912a4589a7',
        latitude: 46.8182,
        longitude: 8.2275,
      ),
      DestinationEntity(
        id: 'paris',
        name: 'Paris',
        country: 'France',
        description: 'Discover art, culture and iconic landmarks.',
        imageUrl: 'https://images.unsplash.com/photo-1502602898657-3e91760cbb34',
        latitude: 48.8566,
        longitude: 2.3522,
      ),
    ];
  }
}