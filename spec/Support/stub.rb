Geocoder.configure(:lookup => :test)
Geocoder::Lookup::Test.add_stub(
  "New York, Ny", [
    {
      'latitude'     => 40.7143528,
      'longitude'    => -74.0059731,
      'address'      => 'New York, NY, USA',
      'state'        => 'New York',
      'state_code'   => 'Ny',
      'country'      => 'United States',
      'country_code' => 'US'
    }
  ]
)
