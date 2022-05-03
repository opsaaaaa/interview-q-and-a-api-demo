def factory_can_create(tag, phrase = "factory can create a")
  it "#{phrase} :#{tag}" do
    object = create(tag)
    expect(object.class.find(object.id)).to eq(object)
  end
end

def factory_raises_error(tag, err:, phrase: "factory can not create a")
  it "#{phrase} :#{tag}" do
    expect {create(tag)}.to raise_error(err)
  end
end

