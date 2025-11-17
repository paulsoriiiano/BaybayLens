import SwiftUI

struct ScanView: View {
    @State private var englishText = "Example text for OCR demo."
    @State private var baybayinText = ""
    private let transliterator = RuleEngine()

    var body: some View {
        VStack(spacing: 16) {
            VStack(alignment: .leading, spacing: 12) {
                Text("English").font(.headline).foregroundStyle(.secondary)
                ScrollView {
                    Text(englishText)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 16).fill(Color(.secondarySystemBackground)))
                }
                Divider().overlay(Color.warmGold).padding(.vertical, 4)
                Text("Baybayin").font(.headline).foregroundStyle(.secondary)
                ScrollView {
                    Text(baybayinText.isEmpty ? "Tap 'Transliterate' to convert" : baybayinText)
                        .font(.custom("NotoSansTagalog-Regular", size: 28))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 16).fill(Color(.secondarySystemBackground)))
                }
            }
            .padding()
            .background(RoundedRectangle(cornerRadius: 20).fill(Color(.systemBackground)).shadow(radius: 4))
            .padding(.horizontal)

            Button {
                baybayinText = transliterator.transliterate(englishText)
            } label: {
                Label("Transliterate", systemImage: "arrow.triangle.2.circlepath")
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 14).fill(Color.warmGold))
                    .foregroundStyle(.white)
            }
            .padding(.horizontal)

            // MARK: Import Photo OCR (future use)
            /*
            import PhotosUI

            @State private var selectedItem: PhotosPickerItem?
            @State private var image: UIImage?
            @State private var isProcessing = false
            private let scanner = VisionTextScanner()

            PhotosPicker(selection: $selectedItem, matching: .images) {
                Label("Import Photo", systemImage: "photo.on.rectangle")
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 14).fill(Color.warmGold.opacity(0.15)))
            }
            .onChange(of: selectedItem) { _, newValue in
                Task {
                    if let data = try? await newValue?.loadTransferable(type: Data.self),
                       let uiimg = UIImage(data: data) {
                        image = uiimg
                        isProcessing = true
                        scanner.recognizeText(in: uiimg) { text in
                            DispatchQueue.main.async {
                                englishText = text ?? ""
                                isProcessing = false
                            }
                        }
                    }
                }
            }
            */

            Spacer()
        }
        .navigationTitle("BaybayLens")
    }
}
